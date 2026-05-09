; DESCRIPTION: Composite: Sets a single magenta pixel at (32, 244) then Renders a white disk with center (345, 118) and radius 44 then Places a red 58x60 rectangle at position (383, 32).
; PLAN: r0=32(x), r1=244(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=345(x), r6=118(y), r7=44(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=383(x), r11=32(y), r12=58(width), r13=60(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 32
LDI r1, 244
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 345
LDI r6, 118
LDI r7, 44
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 383
LDI r11, 32
LDI r12, 58
LDI r13, 60
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
