; DESCRIPTION: Places a magenta 24x47 rectangle at position (437, 190).
; PLAN: r0=437(x), r1=190(y), r2=24(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 190
LDI r2, 24
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
