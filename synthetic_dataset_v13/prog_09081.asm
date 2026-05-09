; DESCRIPTION: Places a yellow 117x86 rectangle at position (276, 79).
; PLAN: r0=276(x), r1=79(y), r2=117(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 79
LDI r2, 117
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
