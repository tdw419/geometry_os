; DESCRIPTION: Places a orange 20x48 rectangle at position (342, 117).
; PLAN: r0=342(x), r1=117(y), r2=20(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 117
LDI r2, 20
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
