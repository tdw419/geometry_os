; mixed program
; initialization
  LDI r4, 0xA0F6C4
  LDI r2, 282
  LDI r15, 0x6E7255
  LDI r10, 2669
  LDI r18, 3131
  LDI r8, 4
  AND r31, r0, r7
  LDI r0, 256
loop_0:
  LDI r15, 10
  LDI r0, 0x8955F5
  LDI r13, 1963
  LDI r2, 2588
  CIRCLE r15, r0, r13, r2
  OR r12, r5, r13
  LDI r6, 1
  SUB r0, r0, r6
  JNZ r0, loop_0
  LDI r12, 0
loop_1:
  CMPI r7, r15, 3
  ANDI r2, r10, 0xABD280
  LDI r15, 1
  SUB r12, r12, r15
  JNZ r12, loop_1
main_2:
  LDI r6, 0x5CEED1
  LDI r2, 2578
  LDI r1, 2509
  LDI r8, 64
  LDI r9, 1
  LINE r6, r2, r1, r8, r9
  IKEY r0
  CMPI r0, 97
  JNZ r0, key_3
  OR r15, r14, r10
  OR r1, r14, r10
  XOR r10, r8, r6
  OR r2, r12, r15
  AND r4, r7, r9
  FRAME
  JMP main_2
