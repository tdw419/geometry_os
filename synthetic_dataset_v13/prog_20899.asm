; DESCRIPTION: Renders a white box of size 94x32 starting at (151, 132).
; PLAN: r0=151(x), r1=132(y), r2=94(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 132
LDI r2, 94
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
