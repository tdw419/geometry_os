; DESCRIPTION: Renders a green box of size 64x22 starting at (285, 213).
; PLAN: r0=285(x), r1=213(y), r2=64(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 213
LDI r2, 64
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
