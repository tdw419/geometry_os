; DESCRIPTION: Places a orange 34x95 rectangle at position (169, 143).
; PLAN: r0=169(x), r1=143(y), r2=34(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 143
LDI r2, 34
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
