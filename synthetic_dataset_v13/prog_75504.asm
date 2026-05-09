; DESCRIPTION: Places a red 15x48 rectangle at position (446, 180).
; PLAN: r0=446(x), r1=180(y), r2=15(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 180
LDI r2, 15
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
