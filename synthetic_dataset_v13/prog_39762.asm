; DESCRIPTION: Renders a green box of size 54x30 starting at (215, 60).
; PLAN: r0=215(x), r1=60(y), r2=54(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 60
LDI r2, 54
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
