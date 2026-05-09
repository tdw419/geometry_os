; DESCRIPTION: Places a blue 28x61 rectangle at position (306, 91).
; PLAN: r0=306(x), r1=91(y), r2=28(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 91
LDI r2, 28
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
