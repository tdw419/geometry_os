; DESCRIPTION: Renders a green box of size 61x115 starting at (341, 124).
; PLAN: r0=341(x), r1=124(y), r2=61(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 124
LDI r2, 61
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
