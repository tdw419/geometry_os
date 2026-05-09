; DESCRIPTION: Renders a cyan box of size 24x112 starting at (227, 103).
; PLAN: r0=227(x), r1=103(y), r2=24(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 103
LDI r2, 24
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
