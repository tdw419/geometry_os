; DESCRIPTION: Places a black 85x38 rectangle at position (157, 213).
; PLAN: r0=157(x), r1=213(y), r2=85(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 213
LDI r2, 85
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
