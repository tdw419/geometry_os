; DESCRIPTION: Places a cyan 103x38 rectangle at position (317, 217).
; PLAN: r0=317(x), r1=217(y), r2=103(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 217
LDI r2, 103
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
