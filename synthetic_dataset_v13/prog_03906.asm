; DESCRIPTION: Renders a blue box of size 24x60 starting at (262, 195).
; PLAN: r0=262(x), r1=195(y), r2=24(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 195
LDI r2, 24
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
