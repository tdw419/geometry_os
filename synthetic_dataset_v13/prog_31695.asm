; DESCRIPTION: Places a orange 98x20 rectangle at position (276, 150).
; PLAN: r0=276(x), r1=150(y), r2=98(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 150
LDI r2, 98
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
