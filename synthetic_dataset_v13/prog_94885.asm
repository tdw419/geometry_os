; DESCRIPTION: Creates a cyan rectangular region at (404, 80) spanning 46 by 27 pixels.
; PLAN: r0=404(x), r1=80(y), r2=46(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 80
LDI r2, 46
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
