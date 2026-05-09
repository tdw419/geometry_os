; DESCRIPTION: Places a white 102x112 rectangle at position (363, 71).
; PLAN: r0=363(x), r1=71(y), r2=102(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 71
LDI r2, 102
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
