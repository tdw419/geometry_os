; DESCRIPTION: Renders a white box of size 57x80 starting at (307, 40).
; PLAN: r0=307(x), r1=40(y), r2=57(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 40
LDI r2, 57
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
