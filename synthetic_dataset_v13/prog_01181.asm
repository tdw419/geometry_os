; DESCRIPTION: Composite: Renders a yellow box of size 32x61 starting at (304, 28) then Sets a single red pixel at (422, 243).
; PLAN: r0=304(x), r1=28(y), r2=32(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=422(x), r6=243(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 304
LDI r1, 28
LDI r2, 32
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 243
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
