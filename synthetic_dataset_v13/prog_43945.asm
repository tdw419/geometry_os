; DESCRIPTION: Renders a yellow box of size 103x20 starting at (197, 196).
; PLAN: r0=197(x), r1=196(y), r2=103(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 196
LDI r2, 103
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
