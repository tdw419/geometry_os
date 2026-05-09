; DESCRIPTION: Places a blue 48x47 rectangle at position (218, 190).
; PLAN: r0=218(x), r1=190(y), r2=48(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 190
LDI r2, 48
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
