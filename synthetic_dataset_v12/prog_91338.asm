; DESCRIPTION: Places a white 57x115 rectangle at position (260, 132).
; PLAN: r0=260(x), r1=132(y), r2=57(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 132
LDI r2, 57
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
