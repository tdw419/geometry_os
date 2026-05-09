; DESCRIPTION: Renders a green box of size 42x83 starting at (218, 4).
; PLAN: r0=218(x), r1=4(y), r2=42(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 4
LDI r2, 42
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
