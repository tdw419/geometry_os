; DESCRIPTION: Places a orange 93x30 rectangle at position (410, 221).
; PLAN: r0=410(x), r1=221(y), r2=93(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 221
LDI r2, 93
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
