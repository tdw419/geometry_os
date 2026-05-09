; DESCRIPTION: Places a black 90x49 rectangle at position (404, 190).
; PLAN: r0=404(x), r1=190(y), r2=90(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 190
LDI r2, 90
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
