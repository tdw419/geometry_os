; DESCRIPTION: Renders a blue box of size 103x90 starting at (277, 164).
; PLAN: r0=277(x), r1=164(y), r2=103(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 164
LDI r2, 103
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
