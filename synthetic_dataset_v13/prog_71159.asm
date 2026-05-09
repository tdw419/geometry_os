; DESCRIPTION: Creates a cyan rectangular region at (246, 174) spanning 33 by 27 pixels.
; PLAN: r0=246(x), r1=174(y), r2=33(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 174
LDI r2, 33
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
