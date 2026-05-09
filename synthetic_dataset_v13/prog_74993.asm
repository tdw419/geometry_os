; DESCRIPTION: Renders a black box of size 61x109 starting at (422, 115).
; PLAN: r0=422(x), r1=115(y), r2=61(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 115
LDI r2, 61
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
