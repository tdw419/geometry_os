; DESCRIPTION: Places a blue 47x38 rectangle at position (317, 213).
; PLAN: r0=317(x), r1=213(y), r2=47(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 213
LDI r2, 47
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
