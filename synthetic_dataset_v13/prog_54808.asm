; DESCRIPTION: Places a cyan 120x79 rectangle at position (79, 86).
; PLAN: r0=79(x), r1=86(y), r2=120(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 86
LDI r2, 120
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
