; DESCRIPTION: Renders a blue box of size 64x44 starting at (198, 103).
; PLAN: r0=198(x), r1=103(y), r2=64(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 103
LDI r2, 64
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
