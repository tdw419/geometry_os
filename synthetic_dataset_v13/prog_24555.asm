; DESCRIPTION: Places a black 34x38 rectangle at position (362, 213).
; PLAN: r0=362(x), r1=213(y), r2=34(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 213
LDI r2, 34
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
