; DESCRIPTION: Creates a cyan rectangular region at (404, 42) spanning 81 by 66 pixels.
; PLAN: r0=404(x), r1=42(y), r2=81(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 42
LDI r2, 81
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
