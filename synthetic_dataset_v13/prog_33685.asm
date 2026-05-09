; DESCRIPTION: Places a orange 111x30 rectangle at position (50, 209).
; PLAN: r0=50(x), r1=209(y), r2=111(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 209
LDI r2, 111
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
