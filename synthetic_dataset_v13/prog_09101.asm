; DESCRIPTION: Places a orange 73x94 rectangle at position (410, 150).
; PLAN: r0=410(x), r1=150(y), r2=73(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 150
LDI r2, 73
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
