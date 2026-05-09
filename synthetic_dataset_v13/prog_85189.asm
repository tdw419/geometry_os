; DESCRIPTION: Places a red 80x45 rectangle at position (72, 142).
; PLAN: r0=72(x), r1=142(y), r2=80(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 142
LDI r2, 80
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
