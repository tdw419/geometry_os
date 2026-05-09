; DESCRIPTION: Places a blue 57x75 rectangle at position (278, 174).
; PLAN: r0=278(x), r1=174(y), r2=57(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 174
LDI r2, 57
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
