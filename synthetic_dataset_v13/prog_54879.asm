; DESCRIPTION: Places a white 47x72 rectangle at position (27, 127).
; PLAN: r0=27(x), r1=127(y), r2=47(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 127
LDI r2, 47
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
