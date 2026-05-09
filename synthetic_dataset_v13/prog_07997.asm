; DESCRIPTION: Places a purple 55x48 rectangle at position (295, 44).
; PLAN: r0=295(x), r1=44(y), r2=55(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 44
LDI r2, 55
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
