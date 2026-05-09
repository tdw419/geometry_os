; DESCRIPTION: Renders a blue box of size 67x53 starting at (180, 190).
; PLAN: r0=180(x), r1=190(y), r2=67(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 190
LDI r2, 67
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
