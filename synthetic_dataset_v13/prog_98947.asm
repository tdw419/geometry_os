; DESCRIPTION: Places a red 71x47 rectangle at position (48, 120).
; PLAN: r0=48(x), r1=120(y), r2=71(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 120
LDI r2, 71
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
