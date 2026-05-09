; DESCRIPTION: Renders a green box of size 14x64 starting at (198, 32).
; PLAN: r0=198(x), r1=32(y), r2=14(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 32
LDI r2, 14
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
