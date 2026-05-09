; DESCRIPTION: Places a black 89x30 rectangle at position (391, 213).
; PLAN: r0=391(x), r1=213(y), r2=89(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 213
LDI r2, 89
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
