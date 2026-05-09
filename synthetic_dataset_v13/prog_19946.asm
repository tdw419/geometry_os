; DESCRIPTION: Renders a white box of size 94x71 starting at (346, 37).
; PLAN: r0=346(x), r1=37(y), r2=94(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 37
LDI r2, 94
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
