; DESCRIPTION: Renders a green box of size 54x90 starting at (367, 128).
; PLAN: r0=367(x), r1=128(y), r2=54(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 128
LDI r2, 54
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
