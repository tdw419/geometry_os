; DESCRIPTION: Places a red 120x66 rectangle at position (298, 37).
; PLAN: r0=298(x), r1=37(y), r2=120(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 37
LDI r2, 120
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
