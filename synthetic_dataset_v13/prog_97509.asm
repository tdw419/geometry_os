; DESCRIPTION: Renders a green box of size 120x111 starting at (168, 66).
; PLAN: r0=168(x), r1=66(y), r2=120(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 66
LDI r2, 120
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
