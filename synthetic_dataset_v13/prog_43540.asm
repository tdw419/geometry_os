; DESCRIPTION: Places a white 47x79 rectangle at position (197, 66).
; PLAN: r0=197(x), r1=66(y), r2=47(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 66
LDI r2, 47
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
