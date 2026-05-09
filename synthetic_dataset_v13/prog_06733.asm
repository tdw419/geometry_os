; DESCRIPTION: Places a red 55x120 rectangle at position (186, 61).
; PLAN: r0=186(x), r1=61(y), r2=55(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 61
LDI r2, 55
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
