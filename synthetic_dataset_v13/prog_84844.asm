; DESCRIPTION: Renders a orange box of size 30x93 starting at (392, 14).
; PLAN: r0=392(x), r1=14(y), r2=30(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 14
LDI r2, 30
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
