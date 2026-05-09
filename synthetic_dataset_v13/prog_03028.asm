; DESCRIPTION: Renders a cyan box of size 112x105 starting at (157, 103).
; PLAN: r0=157(x), r1=103(y), r2=112(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 103
LDI r2, 112
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
