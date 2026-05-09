; DESCRIPTION: Places a cyan 113x44 rectangle at position (276, 9).
; PLAN: r0=276(x), r1=9(y), r2=113(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 9
LDI r2, 113
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
