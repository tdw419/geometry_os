; DESCRIPTION: Places a white 98x30 rectangle at position (382, 202).
; PLAN: r0=382(x), r1=202(y), r2=98(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 202
LDI r2, 98
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
