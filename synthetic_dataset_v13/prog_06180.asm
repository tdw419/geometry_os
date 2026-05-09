; DESCRIPTION: Places a orange 95x73 rectangle at position (180, 107).
; PLAN: r0=180(x), r1=107(y), r2=95(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 107
LDI r2, 95
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
