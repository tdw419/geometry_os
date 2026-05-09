; DESCRIPTION: Places a white 92x18 rectangle at position (391, 157).
; PLAN: r0=391(x), r1=157(y), r2=92(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 157
LDI r2, 92
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
