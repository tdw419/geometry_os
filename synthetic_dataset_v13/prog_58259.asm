; DESCRIPTION: Places a orange 12x24 rectangle at position (135, 143).
; PLAN: r0=135(x), r1=143(y), r2=12(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 143
LDI r2, 12
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
